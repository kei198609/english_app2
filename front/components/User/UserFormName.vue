<template>
  <v-text-field
    v-model="setName"
    :rules="rules"
    :counter="max"
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
  data () {
    const max = 30
    return {
      max,
      rules: [
        // 入力必須のバリデーション、vには入力した値が入る
        v => !!v || '',
        // 30文字まで
        v => (!!v && max >= v.length) || `${max}文字以内で入力してください`
      ]
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
