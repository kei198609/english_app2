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
            <StatsComponent :user="user" />
          </div>
          <div class="text-center mt-3" v-if="userSignedIn">
            <FollowForm :user="user" />
          </div>
          <div class="text-center">
            <v-btn v-if="isCurrentUser" to="edit-user-profile" color="primary">プロフィールを編集する</v-btn>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import StatsComponent from '~/components/StatsComponent.vue'
import FollowForm from '~/components/FollowForm.vue'

export default {
  components: {
    StatsComponent,
    FollowForm
  },
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
    },
    isCurrentUser () {
      return this.$auth.loggedIn && this.$auth.user.id === this.user.id
    }
  },
  created () {
    // Fetch necessary data
  }
}
</script>
