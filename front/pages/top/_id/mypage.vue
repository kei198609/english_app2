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
          <!-- Chart section -->
          <v-col cols="8" class="mt-3">
            <CustomPieChart v-if="data" :chart-data="data"></CustomPieChart>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserSection from '~/components/UserSection.vue'
import CustomPieChart from '~/components/CustomPieChart.vue'

export default {
  components: {
    UserSection,
    CustomPieChart
  },
  // data: nullにテストデータ表示させ円グラフ描画表示検証済み
  data () {
    return {
      drawer: null,
      user: null,
      data: null
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
        this.data = response.data.data
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  },
  created () {
  }
}
</script>
