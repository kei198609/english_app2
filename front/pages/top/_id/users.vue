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
        <UserList
          v-for="user in users"
          :key="user.id"
          :user="user"
        />
        <v-pagination
          v-model="current_page"
          :length="total_pages"
          @input="fetchUsers"
        />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import UserList from '~/components/UserList.vue'

export default {
  components: {
    UserList
  },
  data () {
    return {
      drawer: null,
      users: [],
      total_pages: 0,
      current_page: 1
    }
  },
  async created () {
    await this.fetchUsers()
  },
  methods: {
    async fetchUsers () {
      const response = await this.$axios.get(`/api/v1/users?page=${this.current_page}`)
      this.users = response.data.users
      this.total_pages = response.data.total_pages
    }
  }
}
</script>
