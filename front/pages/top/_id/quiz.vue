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
        <div>
          <v-list v-for="category in categories" :key="category.id">
            <v-list-item>
              <v-list-item-content>
                {{ category.category_name }}
              </v-list-item-content>
            </v-list-item>
            <v-list v-for="q in category.quizzes" :key="q.id">
              <v-list-item>
                <!-- クイズタイトルとリンク -->
                <nuxt-link :to="`/quiz/${q.id}`">{{ q.title }}</nuxt-link>
                <!-- 正誤表示 -->
                <span v-if="getQuizAttempt(q.id)">
                  {{ getQuizAttempt(q.id).correct ? '正解済み' : '不正解' }}
                </span>
              </v-list-item>
            </v-list>
          </v-list>
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      drawer: null,
      categories: []
    }
  },
  methods: {
    getQuizAttempt (quizId) {
      return this.quizAttempts.find(attempt => attempt.quiz_id === quizId)
    }
  },
  async asyncData ({ params, $axios }) {
    const { data: categories } = await $axios.get('/api/v1/categories')
    const { data: quizAttempts } = await $axios.get('/api/v1/quiz_attempts')
    return { categories, quizAttempts }
  }
}
</script>
