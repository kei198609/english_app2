<template>
  <v-container>
    <v-row>
      <v-col class="mt-3">
        <v-card class="pa-4">
          <div class="image-container">
            <v-avatar size="150" class="rounded-circle">
              <img
                :src="user.avatar && user.avatar.url ? user.avatar.url : noimage"
                alt="User Image"
                class="circle-size"
              />
            </v-avatar>
          </div>
          <div class="text-center mb-1">{{ user.name }}</div>
          <div class="text-center border-bottom mb-3">{{ user.occupation }}</div>
          <div class="text-center">
            <StatsComponent :user="user" />
          </div>
          <div class="text-center mt-3" v-if="userSignedIn">
            <FollowForm :user="user" />
          </div>
          <div class="text-center">
            <v-btn v-if="isCurrentUser" :to="`/top/${user.id}/profile`" color="primary">プロフィールを編集する</v-btn>
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
    console.log(this.user) // この行を追加
  }
}
</script>

<style scoped>
.image-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.circle-size {
  object-fit: cover;
}
</style>
