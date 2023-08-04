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
      <!-- メインコンテンツ -->
      <v-parallax>
        <v-img
          :src="homeImg"
          alt="homeImg"
          :aspect-ratio="16/9"
          gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.7)"
        >
        </v-img>
      </v-parallax>
      <v-main class="main-content">
        <v-container>
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
          <v-row justify="center">
            <v-col cols="12">
              <v-card-title>
                ユーザの投稿
              </v-card-title>

              <div
                v-for="post in posts"
                :key="post.id"
              >
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-card
                      class="mx-auto mb-5 my-card"
                      color="#22B2C4"
                      dark
                      :elevation="hover ? 4 : 2"
                      @click="$router.push(`/post/${post.id}/postdetail`)"
                    >
                      <v-icon size="x-large"></v-icon>
                      <v-card-text class="text-h5 font-weight-bold py-2">
                        {{ post.subject_english }}
                      </v-card-text>
                      <v-card-text class="text-h5 font-weight-bold py-2">
                        {{ post.content_english }}
                      </v-card-text>

                      <v-card-actions>
                        <v-list-item class="">
                          <v-avatar size="50" class="clickable-image rounded-circle">
                            <img
                              :src="post.user && post.user.avatar && post.user.avatar.url ? post.user.avatar.url : noimage"
                              @click="$router.push(`/top/${post.user_id}/mypage`)"
                              alt="User Image"
                              class="circle-size clickable-image"
                            />
                          </v-avatar>
                          <v-list-item-content>
                            <v-list-item-title>
                              <!-- <nuxt-link class="routerLink" :to="`/top/${post.user_id}/mypage`">{{ post.user.name }}</nuxt-link> -->
                              {{ post.user.name }}
                            </v-list-item-title>
                            <v-list-item-subtitle>投稿日時: {{ formatDate(post.created_at) }}</v-list-item-subtitle>
                          </v-list-item-content>

                          <!-- <v-list-item-action>
                            <v-icon class="mr-1">mdi-heart</v-icon>
                            <span class="subheading mr-2">256</span>
                            <span class="mr-1">·</span>
                            <v-icon class="mr-1">mdi-share-variant</v-icon>
                            <span class="subheading">45</span>
                          </v-list-item-action> -->

                        </v-list-item>
                      </v-card-actions>
                    </v-card>
                  </template>
                </v-hover>
              </div>
            </v-col>
          </v-row>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import moment from 'moment'
import homeImg from '~/assets/images/logged-in/home.png'
export default {
  data () {
    return {
      drawer: null,
      homeImg,
      posts: null,
      noimage: require('~/assets/images/noimage.jpg'),
      searchQuery: null
    }
  },
  methods: {
    formatDate (dateString) {
      return moment(dateString).format('YYYY-MM-DD HH:mm')
    },
    async searchPosts () {
      console.log('searchPosts is called with query:', this.searchQuery)
      try {
        // const response = await this.$axios.get('/api/v1/posts', { params: { q: { subject_english_or_content_english_cont: this.searchQuery } } })
        const response = await this.$axios.get('/api/v1/posts', { params: { query: this.searchQuery } })
        this.posts = response.data.posts
      } catch (error) {
        console.error('Error fetching posts:', error)
      }
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
  }
}
</script>

<style lang="scss">
#tops {
  .v-parallax__content{
    padding: 0;
  }
  .my-card {
    max-width: 600px;
    height: 200px;
  }
  .clickable-image {
    cursor: pointer;
  }
}
.clickable-image {
  cursor: pointer;

  transition: box-shadow .1s ease-in-out;  // アニメーションを滑らかに

  &:hover {
    box-shadow: 0 0 10px rgba(255, 255, 255, 1.0);  // 光る効果を追加
  }
}
</style>
