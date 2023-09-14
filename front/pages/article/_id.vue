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
            <div>
              <v-card class="px-3 py-3">
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
      article: {}
    }
  },
  // async asyncData ({ params, $axios }) {
  //   const { data: article } = await $axios.get(`/api/v1/articles/${params.id}`)
  //   article.content = JSON.parse(article.content)
  //   return { article }
  // },
  async fetch () {
    try {
      if (this.$auth.loggedIn) {
        // ログインしているユーザーのIDを取得
        const userId = this.$auth.user.id
        // ユーザーの詳細情報を取得
        const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
        this.user = userResponse.data.user

        // 記事のデータを取得
        const { data: article } = await this.$axios.get(`/api/v1/articles/${this.$route.params.id}`)
        article.content = JSON.parse(article.content)
        this.article = article
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  },
  methods: {
    async recordReading () {
      try {
        const response = await this.$axios.$post('/api/v1/article_readings', {
          article_id: this.article.id,
          read: true
        })
        this.user.points = response.current_points
        this.user.level = response.current_level
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
