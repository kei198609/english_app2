<template>
  <v-container>
    <v-row>
      <v-col cols="4" class="mt-3">
        <v-card class="pa-4">
          <v-img
            :src="user.avatar || noimage"
            alt="User Image"
            height="100"
            class="rounded-circle mb-3"
          ></v-img>
          <div class="text-center mb-1">{{ user.name }}</div>
          <div class="text-center border-bottom mb-3">{{ user.occupation }}</div>
          <div class="text-center">
            <!-- <StatsComponent /> -->
          </div>
          <div class="text-center mt-3" v-if="userSignedIn">
            <!-- <FollowForm /> -->
          </div>
          <div class="text-center">
            <v-btn v-if="currentUser" to="edit-user-profile" color="primary">プロフィールを編集する</v-btn>
          </div>
        </v-card>
      </v-col>
      <!-- Here goes the rest of the columns -->
    </v-row>
  </v-container>
</template>

<script>
// import StatsComponent from '~/components/StatsComponent.vue'
// import FollowForm from '~/components/FollowForm.vue'

export default {
  // components: {
  //   StatsComponent,
  //   FollowForm
  // },
  data () {
    return {
      noimage: require('~/assets/images/noimage.jpg')
    }
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  },
  computed: {
    userSignedIn () {
      return this.$auth.loggedIn
    },
    currentUser () {
      return this.$auth.user
    }
  },
  created () {
    // Fetch necessary data
  }
}
</script>
