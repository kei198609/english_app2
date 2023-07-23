<template>
  <div>
    <div>
      <router-link to="`/user/${post.user.id}`" class="link-dark">
        {{ post.user.name }}
      </router-link>
      <p class="post_time link-secondary ms-1 mb-0">
        {{ formatDate(post.created_at) }}
      </p>
    </div>
    <div>
      <router-link to="`/post/${post.id}`" class="link-dark">
        {{ post.subject_english }}
      </router-link>
    </div>
    <div>
      <v-icon class="fa-regular fa-heart text-center me-1" style="color: #AAAAAA;">mdi-heart</v-icon>
      {{ post.likes_count }}
      <v-icon class="fa-regular fa-comment text-center ms-3 me-1" style="color: #AAAAAA;">mdi-comment</v-icon>
      {{ post.comments_count }}
    </div>
  </div>
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
