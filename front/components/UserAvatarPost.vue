<template>
  <v-list-item>
    <v-avatar size="50" class="clickable-image rounded-circle">
      <img
        :src="post.user && post.user.avatar && post.user.avatar.url ? post.user.avatar.url : noimage"
        @click="$router.push(`/top/${post.user_id}/mypage`)"
        alt="User Image"
        class="circle-size clickable-image"
      />
    </v-avatar>
    <v-list-item-content>
      <v-list-item-title>
        {{ post.user.name }}
      </v-list-item-title>
      <v-list-item-subtitle>投稿日時: {{ formatDate(post.created_at) }}</v-list-item-subtitle>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    post: {
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

<style lang="scss" scoped>
.clickable-image {
  cursor: pointer;
  transition: box-shadow .1s ease-in-out;  // アニメーションを滑らかに

  &:hover {
    box-shadow: 0 0 10px rgb(110, 109, 109);  // 光る効果を追加
  }
}
</style>
