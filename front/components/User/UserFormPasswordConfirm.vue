<template>
  <v-text-field
    v-model="setPassword"
    :rules="form.rules"
    :hint="form.hint"
    label="新しいパスワード確認"
    :placeholder="form.placeholder"
    :hide-details="!setValidation"
    :counter="setValidation"
    :append-icon="toggle.icon"
    :type="toggle.type"
    outlined
    autocomplete="on"
    @click:append="show = !show"
  />
</template>

<script>
export default {
  props: {
    password: {
      type: String,
      default: ''
    },
    // バリデーションを切り替えるフラグ
    setValidation: {
      type: Boolean,
      default: false
    },
    checkPasswordMatch: {
      type: Function,
      default: () => true
    }
  },

  data () {
    return {
      show: false
    }
  },

  computed: {
    setPassword: {
      get () {
        return this.password
      },
      set (newValue) {
        return this.$emit('update:password', newValue)
      }
    },
    form () {
      const min = '8文字以上'
      const msg = `${min}。半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます`
      const required = v => !!v || ''
      const format = v => /^[\w-]{8,72}$/.test(v) || msg
      const match = v => this.checkPasswordMatch(v) || 'パスワードが一致しません。'
      const rules = this.setValidation ? [format, match] : [required]
      const hint = this.setValidation ? msg : undefined
      const placeholder = this.setValidation ? min : undefined
      return { rules, hint, placeholder }
    },
    toggle () {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    }
  }
}
</script>
