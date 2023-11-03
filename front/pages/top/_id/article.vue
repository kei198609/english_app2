<template>
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
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="12" md="8" lg="8">
            <v-card outlined class="px-3 py-3 pb-3 mb-5">
              <CategoryArticles
                v-for="category in groupedArticles"
                :key="category.id"
                :category="category"
                :isRead="isRead"
              />
              <v-pagination class="mt-3"
                v-model="current_page"
                :length="total_pages"
                @input="updatePage"
              />
            </v-card>
          </v-col>
          <v-col cols="12" md="4" lg="4">
            <UserSection v-if="user" :user="user" />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserSection from '~/components/UserSection.vue'
import CategoryArticles from '~/components/CategoryArticles.vue'

export default {
  components: {
    UserSection,
    CategoryArticles
  },
  data () {
    return {
      drawer: null,
      user: null,
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
    async fetchData () {
      try {
        if (this.$auth.loggedIn) {
          // ログインしているユーザーのIDを取得
          const userId = this.$auth.user.id
          // ユーザーの詳細情報を取得
          const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
          this.user = userResponse.data.user
          this.user.followers_count = userResponse.data.followers_count
          this.user.following_count = userResponse.data.following_count
          this.data = userResponse.data.data
          // 記事情報を取得
          const articlesResponse = await this.$axios.get(`/api/v1/articles?page=${this.current_page}`)
          this.articles = articlesResponse.data.articles
          this.total_pages = articlesResponse.data.total_pages
          // 記事を読んだかどうか情報を取得
          const readArticlesResponse = await this.$axios.get('/api/v1/article_readings/user_articles_read')
          console.log('API Response for readArticles:', readArticlesResponse.data)
          this.readArticles = readArticlesResponse.data
        }
      } catch (error) {
        console.error('Error fetching data', error)
      }
    }
  },
  async created () {
    await this.fetchData()
  }
}
</script>
