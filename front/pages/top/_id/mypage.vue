<template>
  <v-container>
    <v-row>
      <!-- User section -->
      <v-col cols="4" class="mt-3">
        <div v-if="user">
          <h1>{{ user.name }}</h1>
        </div>
        <!-- <UserSection v-if="user" :user="user" /> -->
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// import UserSection from '~/components/UserSection.vue'

export default {
  // components: {
  //   UserSection
  //   OtherSections
  // },
  data () {
    return {
      user: null
    }
  },
  async fetch () {
    console.log('fetch started')
    console.log('loggedIn:', this.$auth.loggedIn)
    try {
      if (this.$auth.loggedIn) {
        const response = await this.$axios.get(`http://localhost:3000/api/v1/users/${this.$auth.user.id}`)
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
