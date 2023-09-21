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
            <CategoryQuizCard
              v-for="category in categories"
              :key="category.id"
              :category="category"
              :getQuizAttempt="getQuizAttempt"
            />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserSection from '~/components/UserSection.vue'
import CategoryQuizCard from '~/components/CategoryQuizCard.vue'

export default {
  components: {
    UserSection,
    CategoryQuizCard
  },
  data () {
    return {
      drawer: null,
      user: null,
      categories: [],
      quizAttempts: []
    }
  },
  methods: {
    getQuizAttempt (quizId) {
      // findメソッドの代わりにfilterを使用して、特定のクイズIDのすべての試行結果を取得
      const attempts = this.quizAttempts.filter(attempt => attempt.quiz_id === quizId)
      // 最新の試行結果を返す
      return attempts[attempts.length - 1]
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

        const categoriesResponse = await this.$axios.get('/api/v1/categories')
        this.categories = categoriesResponse.data

        const quizResponse = await this.$axios.get('/api/v1/quiz_attempts')
        this.quizAttempts = quizResponse.data

        // ストアからクイズの試行結果を取得
        await this.$store.dispatch('fetchQuizAttempts')
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  }
}
</script>
