<template>
  <div>
    <v-card class="px-3 py-3 bordered-card">
      <v-list-item-content>
        {{ category.category_name_article }}
      </v-list-item-content>
    </v-card>
    <v-card v-for="article in category.articles" :key="article.id" class="mt-1">
      <v-list-item :to="`/article/${article.id}`">
        <v-icon class="pr-3">
          {{ article.icon_name }}
        </v-icon>
        <v-list-item-content>
          <v-row>
            <v-col class="flex-grow-1">
              <v-list-item-title>
                {{ article.title }}
              </v-list-item-title>
            </v-col>
            <v-col v-if="isRead(article.id)">
              <v-list-item-subtitle>
                チェック済み
              </v-list-item-subtitle>
            </v-col>
          </v-row>
        </v-list-item-content>
      </v-list-item>
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

<style scoped>
.bordered-card {
  border-top: 3px solid #7097C3;
}
</style>
