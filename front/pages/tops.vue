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
            <CategoryArticles
              v-for="category in groupedArticles"
              :key="category.id"
              :category="category"
              :isRead="isRead"
            />
            <!-- ページネーションを追加 -->
            <v-pagination
              v-model="current_page"
              :length="total_pages"
              @input="updatePage"
            />
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
import CategoryArticles from '~/components/CategoryArticles.vue'

export default {
  components: {
    UserAvatarPost,
    UserSection,
    CategoryArticles
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
      },
      articles: [],
      readArticles: [],
      total_pages: 0,
      current_page: 1
    }
  },
  computed: {
    groupedArticles () {
      return this.articles.reduce((categories, article) => {
        const category = categories.find(c => c.id === article.category.id)
        if (category) {
          category.articles.push(article)
        } else {
          categories.push({
            id: article.category.id,
            category_name_article: article.category.category_name_article,
            articles: [article]
          })
        }
        return categories
      }, [])
    }
  },
  methods: {
    isRead (articleId) {
      return this.readArticles && this.readArticles.includes(articleId)
    },
    updatePage () {
      this.fetchData()
    },
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
    },
    async fetchData () {
      try {
        if (this.$auth.loggedIn) {
          // ログインしているユーザーのIDを取得
          const userId = this.$auth.user.id
          // ユーザーの詳細情報を取得
          const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
          this.user = userResponse.data.user
          // 記事情報を取得
          const articlesResponse = await this.$axios.get(`/api/v1/articles?page=${this.current_page}`)
          this.articles = articlesResponse.data.articles
          this.total_pages = articlesResponse.data.total_pages
        }
      } catch (error) {
        console.error('Error fetching data', error)
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
    await this.fetchData()
  }
}
</script>

<style lang="scss">
// .genre-image {
//   width: 150px;
//   height: 150px;
// }
</style>
