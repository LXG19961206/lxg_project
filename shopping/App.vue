<template>
  <div id="app">
   
    <router-view style='margin-bottom:20px;' />
   
  </div>
</template>

<script>

export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#app{
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0px;
  bottom: 0px;
}
</style>
