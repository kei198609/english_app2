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
          <v-col cols="8" class="mt-3">
            <CustomPieChart v-if="data" :chart-data="data"></CustomPieChart>
            <v-subheader>Posts</v-subheader>
            <v-list v-if="posts" class="mt-3">
              <v-list-item  v-for="post in posts" :key="post.id">
                <PostListItem :post="post" />
              </v-list-item>
            </v-list>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserSection from '~/components/UserSection.vue'
import CustomPieChart from '~/components/CustomPieChart.vue'
import PostListItem from '~/components/Post/PostListItem.vue'

export default {
  components: {
    UserSection,
    CustomPieChart,
    PostListItem
  },
  // data: nullにテストデータ表示させ円グラフ描画表示検証済み
  data () {
    return {
      drawer: null,
      user: null,
      data: null,
      posts: null
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
        console.log(this.posts) // ここでレスポンスの内容を確認します
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
