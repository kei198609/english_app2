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
          <v-col cols="12" md="4" lg="4">
            <UserSection v-if="user" :user="user" />
          </v-col>
          <v-col cols="12" md="8" lg="8">
            <div v-for="category in groupedArticles" :key="category.id">
              <v-card class="px-3 py-3">
                <v-list-item-content>
                  {{ category.category_name_article }}
                </v-list-item-content>
              </v-card>
              <v-card v-for="article in category.articles" :key="article.id" class="mt-1 px-3 py-5">
                <v-card-text>
                  <v-icon class="pr-3">{{ article.icon_name }}</v-icon>
                  <nuxt-link :to="`/article/${article.id}`">{{ article.title }}</nuxt-link>
                  <span v-if="isRead(article.id)">チェック済み</span>
                </v-card-text>
              </v-card>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserSection from '~/components/UserSection.vue'

export default {
  components: {
    UserSection
  },
  data () {
    return {
      drawer: null,
      user: null,
      articles: [],
      readArticles: []
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
        // 記事情報を取得
        const articlesResponse = await this.$axios.get('/api/v1/articles')
        this.articles = articlesResponse.data
        // 記事を読んだかどうか情報を取得
        const readArticlesResponse = await this.$axios.get('/api/v1/article_readings/user_articles_read')
        console.log('API Response for readArticles:', readArticlesResponse.data)
        this.readArticles = readArticlesResponse.data
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  }
}
</script>
