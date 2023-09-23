<template>
  <div
    id="tops"
  >
    <v-app>
      <logged-in-app-bar clipped-left>
        <template v-slot:navigation-toggle-button>
          <v-app-bar-nav-icon
            @click="drawer = !drawer"
          />
        </template>
      </logged-in-app-bar>
      <!-- ナビゲーションドロワー -->
      <top-navigation-drawer
        :drawer.sync="drawer"
      />
      <v-main class="main-content">
        <v-container>
          <v-row justify="center">
            <v-col cols="12" md="8">
            <!-- 検索フォーム -->
            <v-form>
              <v-text-field
                v-model="searchQuery"
                label="英文検索"
                prepend-icon="mdi-magnify"
                solo
              />
              <v-btn @click.prevent="searchPosts" color="primary">
                検索
              </v-btn>
            </v-form>
              <v-card class="px-3 py-3 mb-5">
                新着一覧
              </v-card>
              <div
                v-for="post in posts"
                :key="post.id"
              >
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-card
                      class="mx-auto mb-5"
                      :elevation="hover ? 4 : 2"
                      @click="$router.push(`/post/${post.id}/postdetail`)"
                    >
                      <v-row class="px-3">
                        <v-col cols="12" lg="5">
                          <v-img :src="getGenreImageUrl(post)" alt="ジャンルの画像" class="genre-image"></v-img>
                        </v-col>
                        <v-col class="d-flex flex-column justify-space-between">
                          <v-card-text class="text-h5 mb-auto">
                            {{ post.title }}
                          </v-card-text>
                          <v-card-actions>
                            <UserAvatarPost :post="post" :noimage="noimage" />
                          </v-card-actions>
                        </v-col>
                      </v-row>
                    </v-card>
                  </template>
                </v-hover>
              </div>
            </v-col>
            <v-col cols="12" md="4" lg="4">
              <UserSection v-if="user" :user="user" />
            </v-col>
          </v-row>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import UserAvatarPost from '~/components/UserAvatarPost.vue'
import UserSection from '~/components/UserSection.vue'

export default {
  components: {
    UserAvatarPost,
    UserSection
  },
  data () {
    return {
      drawer: null,
      user: null,
      posts: null,
      noimage: require('~/assets/images/noimage.jpg'),
      searchQuery: null,
      genreImageMapping: {
        ビジネス文書: 'business_documents',
        英語メール表現: 'english_email_expressions',
        一般的な英文メッセージ: 'general_english_message'
      }
    }
  },
  methods: {
    async searchPosts () {
      console.log('searchPosts is called with query:', this.searchQuery)
      try {
        const response = await this.$axios.get('/api/v1/posts', { params: { query: this.searchQuery } })
        this.posts = response.data.posts
      } catch (error) {
        console.error('Error fetching posts:', error)
      }
    },
    getGenreImageUrl (post) {
      if (post && post.genre && this.genreImageMapping[post.genre]) {
        const imageName = this.genreImageMapping[post.genre]
        return require(`@/assets/images/${imageName}.jpg`)
      }
      return this.noimage // ジャンル画像がない場合にデフォルト画像を表示
    }
  },
  async created () {
    try {
      const response = await this.$axios.get('/api/v1/posts')
      this.posts = response.data.posts
      console.log(this.posts)
    } catch (error) {
      console.error('Error fetching posts:', error)
    }
  },
  async fetch () {
    try {
      if (this.$auth.loggedIn) {
        // ログインしているユーザーのIDを取得
        const userId = this.$auth.user.id
        // ユーザーの詳細情報を取得
        const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
        this.user = userResponse.data.user
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  }
}
</script>

<style lang="scss">
// .genre-image {
//   width: 150px;
//   height: 150px;
// }
</style>
