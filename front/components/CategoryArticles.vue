<template>
  <div>
    <v-card class="px-3 py-3">
      <v-list-item-content>
        {{ category.category_name_article }}
      </v-list-item-content>
    </v-card>
    <v-card v-for="article in category.articles" :key="article.id" class="mt-1 px-3 py-5">
      <v-card-text>
        <v-icon class="pr-3">{{ article.icon_name }}</v-icon>
        <nuxt-link :to="`/article/${article.id}`">{{ article.title }}</nuxt-link>
        <span v-if="isRead(article.id)">チェック済み</span>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  props: {
    category: {
      type: Object,
      required: true
    },
    isRead: {
      type: Function,
      required: true
    }
  }
}
</script>
