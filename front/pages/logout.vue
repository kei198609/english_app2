<script>
export default {
  // middlewareはページをレンダリングする前に実行される
  middleware ({ redirect }) {
    return redirect('/')
  }
}
</script>
