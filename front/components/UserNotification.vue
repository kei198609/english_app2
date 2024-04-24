<template>
<v-card class="mb-1">
  <div class="px-5 py-3">
    <span>
      <nuxt-link v-if="visitor" :to="`/top/${visitor.id}/mypage`">
        <strong>{{ visitor.name }}</strong>
      </nuxt-link>
      さんが
      <span v-if="notification.action === 'like'">
        <nuxt-link :to="`/post/${notification.post_id}/postdetail`">
          あなたの投稿
        </nuxt-link>
        にいいねしました。
      </span>

      <span v-else-if="notification.action === 'comment'">
        <nuxt-link :to="`/post/${notification.post_id}/postdetail`">
          あなたの投稿
        </nuxt-link>
          にコメントしました。
      </span>
        <p class="text-muted mb-0 mt-2">
          {{ formatDate(notification.created_at) }}
        </p>
    </span>
  </div>
</v-card>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    notification: {
      type: Object,
      required: true
    }
  },
  computed: {
    visitor () {
      return this.notification.visitor
    },
    visited () {
      return this.notification.visited
    }
  },
  methods: {
    formatDate (dateString) {
      return moment(dateString).format('YYYY-MM-DD HH:mm')
    }
  }
}
</script>
