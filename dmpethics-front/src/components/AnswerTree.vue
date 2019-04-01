<!-- Represents tree structure and other form fields. Submitting the form sends data to a Semantic MediaWiki. -->
<template>

  <div class="container">
    <div class="wikilink">
      <a :href="'http://localhost/smw/index.php/'+encodeURI(answerData.study)">View your study's wiki page</a>
    </div>   
    <div v-show="showFormValues">

 
      <p>Successfully submitted!</p>
    </div> 
    <div v-show="!showFormValues">
          <h3>Edit/Create your wiki page</h3>
    <div class="form-wiki-field">
      <label class="" :for="studytitle">Study title</label>
      <input :value="answerData.study">
    </div>
      <div class="form-field">
          <label class="form-label">Main institution for the study</label>
          <input type="text" class="input" name="institution" v-model="institution">
      </div>
      <div class="form-field">
        <label class="form-label">Country</label>
        <input type="text" class="input" name="country" v-model="country">
      </div>
      <div class="form-field">
        <label class="form-label">Study description</label><br>
        <textarea name="studydesc" v-model="studydesc"></textarea>
      </div>
        <answer-node-tree :answers="selectedAnswers" @input="handleFile"></answer-node-tree>
        <button class="submitQuestionnaire" @click="saveAnswer">Submit</button>
    </div>
    </div>

</template>

<script>
import AnswerNodeTree from "./AnswerNodeTree";
import axios from "axios";

export default {
  props: {
    answerData: Object,
    detailData: Object
  },
  data() {
    return{
      studytitle: this.answerData.study,
      studydesc: "",
      institution: "",
      country: "",
      existingdata: "",
      files:[],
      showFormValues: false
    }
  },
  computed:{
    selectedAnswers (){
      return JSON.parse(this.answerData.data)
    }
 },
  components: {
    AnswerNodeTree
  },
  methods: {
    handleFile(event){
      this.files.push(event);
    },
    getAnswers() {
      axios
      .get('http://10.0.0.2:80/smw/api.php?action=parse&page=Main_Page&format=json')
      .then(response => {
        this.existingdata = response;
      })
    },
    saveAnswer() {
      var params = {
        'title': this.studytitle,
        'country': this.country,
        'institution': this.institution,
        'description': this.studydesc
      };
       axios
      .post('http://localhost:3000/smwapi', params)
      .then(response => {
        this.existingdata = response;
        this.showFormValues = true;
      })
      } 
  }
  
};
</script>
