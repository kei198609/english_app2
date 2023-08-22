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
  async asyncData ({ params, $axios }) {
    const { data } = await $axios.get('/api/v1/categories')
    return { categories: data }
  }
}
</script>
