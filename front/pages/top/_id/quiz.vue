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
          <v-list v-for="q in quizzes" :key="q.id">
            <nuxt-link :to="`/quiz/${q.id}`">{{ q.title }}</nuxt-link>
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
      quizzes: []
    }
  },
  async asyncData ({ params, $axios }) {
    const { data } = await $axios.get('/api/v1/quizzes')
    return { quizzes: data }
  }
}
</script>
