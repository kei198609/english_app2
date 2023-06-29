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
          <v-col cols="4" class="mt-3">
            <UserSection v-if="user" :user="user" />
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
    // ChartSections
  },
  data () {
    return {
      drawer: null,
      user: null
    }
  },
  async fetch () {
    console.log('fetch started')
    console.log('loggedIn:', this.$auth.loggedIn)
    console.log(this.$route.params.id)
    try {
      if (this.$auth.loggedIn) {
        // this.$route.params.idがundefinedであればthis.$auth.user.idを使用し、それ以外の場合はthis.$route.params.idを使用するという条件分岐
        const userId = this.$route.params.id ? this.$route.params.id : this.$auth.user.id
        const response = await this.$axios.get(`http://localhost:3000/api/v1/users/${userId}`)
        // const response = await this.$axios.get(`http://localhost:3000/api/v1/users/${this.$route.params.id}`)
        // const response = await this.$axios.get(`http://localhost:3000/api/v1/users/${this.$auth.user.id}`)
        this.user = response.data.user
      }
    } catch (error) {
      console.error('Error fetching data', error)
    }
  },
  created () {
  }
}
</script>
