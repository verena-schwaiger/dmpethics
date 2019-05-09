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

a:link {
  color: #43669e;
}

a:hover {
  text-decoration: none;
}

a:visited {
  color: #afafaf;
}

.requirement {
  color: #afafaf;
}

.navlink {
  margin-left: 20px;
}
.tabs {
  overflow: hidden;
}

.tabs ul {
    list-style-type: none;
    margin-left: 20px;
}

.tabs a{
    float: left;
    cursor: pointer;
    padding: 12px 24px;
    font-weight: bold;
    color: #808080;
}

.tabs a:hover {
  border-bottom: 1px solid #000;
  color: #000;
}

.tabs a.active {
    color: #000;
    cursor: pointer;
    border-bottom: 1px solid #000;
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
  color: #43669e;
  display: inline-block;
}


.study-header:hover{
  color: rgb(85, 85, 85);
  background-color: #f0f0f0;
  text-decoration: none;
}

.delete{
  padding: 5px;
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
.form-wiki-docs{
  padding: 10px;
}
.columns {
  column-width: 300px;
  max-width: 700px;
  margin: 0 auto;
}

.form-wiki-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 2em;
  grid-gap: .5em;
  max-width: 700px;
}

.form-wiki-field {
  column-width: 200px;
}
.form-checklist-field {
  column-width: 100px;
}

.form-checklist-row {
  padding: 5px;
}

.form-check-input {
  margin-right: 10px;
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

.done {
  background-color: #d1ffda;
  padding: 5px;
}

.missing{
  background-color: #ffcccc;
  padding: 5px;
}

.submitChecklist {
  margin-top: 20px;
}
</style>
