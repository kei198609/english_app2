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
          <!-- User section -->
          <v-col cols="12" md="4" lg="4">
            <UserSection v-if="user" :user="user" />
          </v-col>
            <v-col cols="12" md="4" lg="4">
              <v-card class="bordered-card">
                <div class="text-center pt-3">基礎チェック問題</div>
                <div class="pa-6">
                  <CustomPieChart v-if="articleChartData" :chartData="articleChartData" />
                </div>
              </v-card>
            </v-col>
            <v-col cols="12" md="4" lg="4">
              <v-card class="bordered-card">
                <div class="text-center pt-3">並び替え問題</div>
                <div class="pa-6">
                  <CustomPieChart v-if="chartData" :chartData="chartData" />
                </div>
              </v-card>
            </v-col>

          <v-col cols="12" class="mt-3">
            <v-card outlined class="px-3 py-3 mb-1 bordered-card">
              投稿
            </v-card>
            <v-data-table
              v-if="posts"
              :headers="headers"
              :items="posts"
              :items-per-page="5"
              class="elevation-1"
            >
              <template v-slot:body="{ items }">
                <tbody>
                  <tr v-for="item in items" :key="item.id">
                    <td>{{ formatDate(item.created_at) }}</td>

                    <td>
                        {{ item.genre }}
                    </td>

                    <td>
                      <router-link :to="`/post/${item.id}/postdetail`">
                        {{ item.title }}
                      </router-link>
                    </td>

                    <td>
                      <v-icon class="fa-regular fa-heart text-center me-1" style="color: #AAAAAA;">mdi-heart</v-icon>
                      {{ item.likes_count }}
                    </td>

                    <td>
                      <v-icon class="fa-regular fa-comment text-center ms-3 me-1" style="color: #AAAAAA;">mdi-comment</v-icon>
                      {{ item.comments_count }}
                    </td>
                    <td>
                      <v-btn icon @click="deletePost(item.id)" v-if="item.user_id === currentUserId">
                        <v-icon>mdi-delete</v-icon>
                      </v-btn>
                    </td>
                  </tr>
                </tbody>
              </template>
            </v-data-table>
          </v-col>
        </v-row>
        <v-snackbar v-model="snackbar" top right color="success" outlined>
          {{ snackbarMessage }}
          <v-btn color="black" text @click="snackbar = false">
            閉じる
          </v-btn>
      </v-snackbar>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import moment from 'moment'
import UserSection from '~/components/UserSection.vue'
import CustomPieChart from '~/components/CustomPieChart.vue'

export default {
  components: {
    UserSection,
    CustomPieChart
  },
  data () {
    return {
      drawer: null,
      user: null,
      data: null,
      chartData: null,
      articleChartData: null,
      posts: null,
      scenes: [],
      snackbar: false,
      snackbarMessage: '',
      currentUserId: this.$auth.user.id,
      headers: [
        { text: '投稿日時', value: 'created_at' },
        { text: 'ジャンル', value: 'genre' },
        { text: '件名', value: 'title' },
        { text: 'いいね数', value: 'likes_count' },
        { text: 'コメント数', value: 'comments_count' },
        { text: '投稿削除', value: 'post_delete' }
      ]
    }
  },
  methods: {
    formatDate (dateString) {
      return moment(dateString).format('YYYY-MM-DD HH:mm')
    },
    async deletePost (postId) {
      try {
        await this.$axios.delete(`/api/v1/posts/${postId}`)
        this.posts = this.posts.filter(post => post.id !== postId) // 投稿をローカルのリストから削除
      } catch (error) {
        console.error('Error deleting post:', error)
      }
      this.snackbar = true
      this.snackbarMessage = '投稿を削除しました。'
    }
  },
  async fetch () {
    try {
      if (this.$auth.loggedIn) {
        // this.$route.params.idがundefinedであればthis.$auth.user.idを使用し、それ以外の場合はthis.$route.params.idを使用するという条件分岐
        const userId = this.$route.params.id ? this.$route.params.id : this.$auth.user.id
        const response = await this.$axios.get(`/api/v1/users/${userId}`)
        this.user = response.data.user
        this.user.followers_count = response.data.followers_count
        this.user.following_count = response.data.following_count
        this.data = response.data.data

        const postResponse = await this.$axios.get(`/api/v1/posts?user_id=${userId}`)
        this.posts = postResponse.data.posts

        // クイズの正解、不正解、未学習のデータをAPIから取得
        const quizResponse = await this.$axios.get(`/api/v1/users/${userId}/quiz_statistics`)
        this.chartData = {
          正解: quizResponse.data.correct,
          不正解: quizResponse.data.incorrect,
          未学習: quizResponse.data.unattempted
        }
        const articleResponse = await this.$axios.get(`/api/v1/users/${userId}/article_statistics`)
        this.articleChartData = {
          チェック済み: articleResponse.data.read,
          未チェック: articleResponse.data.unread
        }
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  },
  created () {
  }
}
</script>

<style scoped>
.v-list-item {
  border-bottom: 1px solid #ddd
}

.v-list-item:hover {
  background-color: lightgray
}

.bordered-card {
  border-top: 3px solid #7097C3;
}
</style>
