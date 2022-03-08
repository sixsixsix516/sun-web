<template>
  <div class="top">
    <div>
      {{ title }}
    </div>
    <div>
      <breadcrumb id="breadcrumb-container" class="breadcrumb-container"/>
    </div>
  </div>
</template>

<script>
import Breadcrumb from '@/components/Breadcrumb'

export default {
  components: {
    Breadcrumb
  },
  data() {
    return {
      title: ''
    }
  },
  watch: {
    $route() {
      this.updateTitle();
    }
  },
  mounted() {
    this.updateTitle();
  },
  methods: {
    updateTitle(){
      let matched = this.$route.matched.filter(item => item.meta && item.meta.title)
      this.title = matched[matched.length - 1].meta.title
    }
  }
}
</script>

<style scoped>
.top {
  background-color: #EFF2F7;
  display: flex;
  justify-content: space-between;
  height: 50px;
  align-items: center;
  padding: 0 40px 0 30px;
}

.top > div:first-child {
  font-weight: bold;
  color: #3A4758;
}


</style>
