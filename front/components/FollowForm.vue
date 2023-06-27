<template>
  <div v-if="!isCurrentUser" id="follow_form">
    <div v-if="isFollowing">
      <UnfollowButton @click="unfollow" />
    </div>
    <div v-else>
      <FollowButton @click="follow" />
    </div>
  </div>
</template>

<script>
import FollowButton from '~/components/Button/FollowButton.vue'
import UnfollowButton from '~/components/Button/UnfollowButton.vue'

export default {
  components: {
    FollowButton,
    UnfollowButton
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      isFollowing: false
    }
  },
  computed: {
    // 2つの条件が両方ともtrueであれば、isCurrentUserはtrueになる
    // trueである場合、フォロー/アンフォローボタンは表示されない
    isCurrentUser () {
      return this.$auth.loggedIn && this.$auth.user.id === this.user.id
    }
  },
  methods: {
    async follow () {
      try {
        await this.$axios.post(`/api/v1/users/${this.user.id}/follow`)
        this.isFollowing = true
      } catch (err) {
        console.error(err)
      }
    },
    async unfollow () {
      try {
        await this.$axios.post(`/api/v1/users/${this.user.id}/unfollow`)
        this.isFollowing = false
      } catch (err) {
        console.error(err)
      }
    }
  },
  async fetch () {
    try {
      const res = await this.$axios.get(`/api/v1/users/${this.user.id}/following_status`)
      this.isFollowing = res.data.following
    } catch (err) {
      console.error(err)
    }
  }
}
</script>
