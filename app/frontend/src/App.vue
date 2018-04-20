<template>
  <div id="app">
    <app-header></app-header>
    <div id="contents">
      <router-view/>
    </div>
    <sui-divider clearing />
    <app-footer></app-footer>
  </div>
</template>

<script>
import AppHeader from './components/commons/AppHeader.vue'
import AppFooter from './components/commons/AppFooter.vue'

export default {
  name: 'App',
  components: {
    AppHeader,
    AppFooter
  }
}
</script>

<style>
#app {
  font-family: 'Roboto Mono', monospace;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#contents {
  min-height: 800px;
  padding-top: 61px;
}
</style>
