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
          <h1>{{ article.title }}</h1>
          <div v-for="(line, index) in article.content" :key="index">

            <template v-if="line !== '<<SPACE>>'">
              <p :class="{ 'bold-text': line.startsWith('**') && line.endsWith('**') }">
                {{ line.replace(/\*\*/g, '') }}
              </p>
            </template>
            <template v-else>
              <br />
            </template>

          </div>
          <v-btn color="primary" @click="recordReading">理解しました</v-btn>
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
      article: {}
    }
  },
  async asyncData ({ params, $axios }) {
    const { data: article } = await $axios.get(`/api/v1/articles/${params.id}`)
    article.content = JSON.parse(article.content)
    return { article }
  },
  methods: {
    async recordReading () {
      try {
        await this.$axios.$post('/api/v1/article_readings', {
          article_id: this.article.id,
          read: true
        })
        // 成功時のメッセージを表示
        alert('10ポイント獲得しました。')
      } catch (error) {
        console.error('Error:', error)
        alert('エラーが発生しました。')
      }
    }
  }
}
</script>

<style scoped>
.bold-text {
  font-weight: bold;
}
</style>
