<template>
  <v-text-field
    v-model="setName"
    label="ユーザー名を入力"
    placeholder="あなたの表示名"
    outlined
  />
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      default: ''
    }
  },
  // 算出プロパティを使って双方向バインディング
  // ゲッターには親から受け取ったデータが入る
  // セッターには更新されたデータが入る
  computed: {
    setName: {
      get () {
        return this.name
      },
      set (newValue) {
        return this.$emit('update:name', newValue)
      }
    }
  }
}
</script>
