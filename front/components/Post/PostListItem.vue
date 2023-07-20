<template>
  <v-container>
    <v-row class="bg-white">
      <v-col class="d-flex border-top pt-3">
        <div>
          <v-img
            :src="post.user.avatar.url || 'noimage'"
            class="rounded-circle"
            width="32"
            height="32"
          />
        </div>
        <div class="post_user">
          <p class="ms-1 mb-0">
            <router-link to="`/user/${post.user.id}`" class="link-dark">
              {{ post.user.name }}
            </router-link>
          </p>
          <p class="post_time link-secondary ms-1 mb-0">
            {{ formatDate(post.created_at) }}
          </p>
        </div>
        <div class="ms-auto">
          <!-- 削除機能はサーバーサイドとの通信が必要です -->
        </div>
      </v-col>
      <v-col class="post_subject ps-5">
        <router-link to="`/post/${post.id}`" class="link-dark">
          {{ post.subject_english }}
        </router-link>
      </v-col>
      <v-col class="post_scene ps-5 pb-3">
        <p class="mb-0">{{ post.scene }}</p>
        <p class="mb-0">
          <v-icon class="fa-regular fa-heart text-center me-1" style="color: #AAAAAA;">mdi-heart</v-icon>
          {{ post.likes_count }}
          <v-icon class="fa-regular fa-comment text-center ms-3 me-1" style="color: #AAAAAA;">mdi-comment</v-icon>
          {{ post.comments_count }}
        </p>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import moment from 'moment'

export default {
  props: {
    post: {
      type: Object,
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
