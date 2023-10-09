<template>
  <v-list-item>
    <v-avatar size="50" class="clickable-image rounded-circle">
      <img
        :src="bookmark.post.user.avatar && bookmark.post.user.avatar.url ? bookmark.post.user.avatar.url : noimage"
        @click.stop="$router.push(`/top/${bookmark.post.user.id}/mypage`)"
        alt="User Image"
        class="circle-size clickable-image"
      />
    </v-avatar>
    <v-list-item-content>
      <v-list-item-title>
        {{ bookmark.post.user.name }}
      </v-list-item-title>
      <v-list-item-subtitle>
        投稿日時: {{ formatDate(bookmark.post.created_at) }}
      </v-list-item-subtitle>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    bookmark: {
      type: Object,
      required: true
    },
    noimage: {
      type: String,
      required: true
    }
  },
  methods: {
    formatDate (dateString) {
      return moment(dateString).format('YYYY-MM-DD HH:mm')
    }
  }
}
</script>
