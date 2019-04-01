<template>
  <div id="app">
         <Navigation></Navigation>
          <router-view></router-view>

  </div>
</template>

<script>
import Navigation from './components/Navigation'
export default {
  name: 'app',
  components: { 
  'Navigation': Navigation 
}
}
</script>

<style lang="scss">
body {
  font-family: sans-serif;
}
.nav {
    background-color: #eaeaea;
    padding: 20px;
}

.navlink {
  margin-left: 20px;
}

.container {
  padding: 20px;
}

.wikilink {
  padding: 10px;
}

div.question {
  padding: 30px 0px 10px 5%;
  padding-left: 5%;
}

div.subquestion {
  padding: 10px;
  padding-left: 10%;
}

div.warning {
  background: #ffeca8;
  border: 1px solid #efbb00;
  padding: 10px 10px 10px 10px;
  display: inline-block
}

div.box {
  padding-left: 5%;
  padding-top: 10px;
}

.study {
  padding: 10px;
}

.study-header{
  border-bottom: 2px solid #ccc;
  background-color: #f7f7f7;
  padding: 10px;
}

.study-header a:link, a:visited{
  color: #808080;
  display: inline-block;
}


.study-header:hover{
  color: rgb(85, 85, 85);
  background-color: #f0f0f0;
  text-decoration: none;
}

.form-wiki-outer{
    padding: 5%;

}

.form-wiki{
  border: 1px solid #eaeaea;
  border-bottom: 2px solid #ccc;
  background-color: #f7f7f7;
  padding: 10px;

}

.form-wiki-field{
  padding: 10px;
}

.form-wiki-field label{
  padding: 10px;
}

.form-field {
  padding: 10px;
}

.form-field label {
  padding: 10px;
}

label {
  padding-left: 5px;
}
</style>
