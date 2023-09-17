<template>
  <v-hover>
    <template v-slot:default="{ hover }">
      <v-card
        class="mx-auto mb-5 my-card"
        color="#22B2C4"
        dark
        :elevation="hover ? 4 : 2"
        @click="$router.push(`/post/${bookmark.post.id}/postdetail`)"
      >
        <v-icon size="x-large"></v-icon>
        <v-card-text class="text-h5 font-weight-bold py-2">
          {{ bookmark.post.title }}
        </v-card-text>
        <v-card-text class="text-h5 font-weight-bold py-2">
          {{ bookmark.post.content }}
        </v-card-text>

        <v-card-actions>
          <v-list-item class="">
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
        </v-card-actions>
      </v-card>
    </template>
  </v-hover>
</template>

<script>
import moment from 'moment'
export default {
  data () {
    return {
      noimage: require('~/assets/images/noimage.jpg')
    }
  },
  props: {
    bookmark: {
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

<style scoped>
  .clickable-image {
    cursor: pointer;
  }
  .my-card {
    max-width: 600px;
    height: 200px;
  }
</style>
