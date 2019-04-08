<!-- Represents tree structure and other form fields. Submitting the form sends data to a Semantic MediaWiki. -->
<template>

  <div class="container">
    <div class="wikilink">
      <a :href="'http://localhost/smw/index.php/'+encodeURI(answerData.study)">View your study's wiki page</a>
    </div>   
    <div v-show="submitted">
      <p>Successfully submitted!</p>
    </div> 
    <!-- Errors point to network problems. -->
    <div v-show="error">
      <p>Error while submitting. Please reload the page and try again.</p>
    </div>
    <div v-show="!submitted">
      <h3>Edit/Create your wiki page</h3>
      <div class="form-wiki-row">
          <label class="" :for="studytitle">Study title</label>
          <input :value="answerData.study">

          <label class="" :for="studytitle">Existing Application PID</label>
          <input type="text" class="input" name="applicationpid" v-model="applicationpid">

          <label class="form-label">Main institution for the study</label>
          <input type="text" class="input" name="institution" v-model="institution">

          <label class="form-label">Country</label>
          <input type="text" class="input" name="country" v-model="country">
      </div>

        <div class="form-field">
          <label class="form-label">Study description</label><br>
          <textarea name="studydesc" v-model="studydesc"></textarea>
        </div>              

          <answer-node-tree :answers="selectedAnswers" v-on:addedfile="handleFileUpload"></answer-node-tree>
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
      applicationpid: "",
      existingdata: "",
      files:[],
      submitted: false,
      error: false,
      fields: [
        'applicationpid',
        'institution',
        'country',
      ]
    }
  },
  computed:{
    selectedAnswers (){
      return JSON.parse(this.answerData.data).questiondata
    }
 },
  components: {
    AnswerNodeTree
  },
  methods: {
    handleFileUpload: function(event){
      alert("y");
       this.files.push(event);
    },

    getAnswers() {
      var params = {
        'title': this.studytitle
      };
      axios
      .get('http://localhost:3000/smwapi', params)
      .then(response => {
        this.existingdata = response.existingdata;
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
        if(response.status === 200){
          this.submitted = true;
        }
        else{
          this.error = true;
        }
      })
      } 
  }
  
};
</script>
