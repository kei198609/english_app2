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
        <div v-if="notifications.length">
          <UserNotification
            v-for="notification in notifications"
            :key="notification.id"
            :notification="notification"
          />
        </div>
        <div v-else>
          <p>通知はありません</p>
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserNotification from '~/components/UserNotification.vue'

export default {
  components: {
    UserNotification
  },
  data () {
    return {
      drawer: null,
      notifications: []
    }
  },
  created () {
    this.fetchData()
  },
  methods: {
    async fetchData () {
      try {
        if (this.$auth.loggedIn) {
          const userId = this.$auth.user.id
          const notificationsResponse = await this.$axios.get(`/api/v1/notifications?user_id=${userId}`)
          this.notifications = notificationsResponse.data
        }
      } catch (error) {
        console.error('Error fetching data', error)
      }
    }
  }
}
</script>
