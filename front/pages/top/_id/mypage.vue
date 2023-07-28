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
          <v-col cols="12" md="4" lg="4" class="mt-3">
            <UserSection v-if="user" :user="user" />
          </v-col>
          <!-- Chart and Posts section -->
          <v-col cols="12" md="8" lg="8" class="mt-3">
            <CustomPieChart v-if="data" :chart-data="data"></CustomPieChart>

            <v-subheader>投稿</v-subheader>

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
                        {{ item.scene }}
                    </td>

                    <td>
                      <router-link :to="`/post/${item.id}/postdetail`">
                        {{ item.subject_english }}
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
                  </tr>
                </tbody>
              </template>
            </v-data-table>

          </v-col>
        </v-row>
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
      posts: null,
      headers: [
        { text: '投稿日時', value: 'created_at' },
        { text: 'ビジネスシーン', value: 'scene' },
        { text: '件名', value: 'subject_english' },
        { text: 'いいね数', value: 'likes_count' },
        { text: 'コメント数', value: 'comments_count' }
      ]
    }
  },
  methods: {
    formatDate (dateString) {
      return moment(dateString).format('YYYY-MM-DD HH:mm')
    }
  },
  async fetch () {
    console.log('fetch started')
    console.log('loggedIn:', this.$auth.loggedIn)
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
        console.log(this.posts) // ここでレスポンスの内容を確認
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
</style>
