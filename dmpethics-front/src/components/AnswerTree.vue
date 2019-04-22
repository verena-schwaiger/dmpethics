<!-- Represents tree structure and other form fields. Submitting the form sends data to a Semantic MediaWiki. -->
<template>

  <div class="container">
    <div class="wikilink">
      <a :href="'http://localhost/smw/index.php/'+encodeURI(answerData.id)">View your study's wiki page</a>
    </div>   
  
    <div>
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
          
          <label class="form-label">Topics</label>
          <input type="text" class="input" name="topics" v-model="topics">
      </div>

        <div class="form-field">
          <label class="form-label">Study description</label><br>
          <textarea name="studydesc" v-model="studydesc"></textarea>
        </div>    

        <button class="submitQuestionnaire" @click="saveAnswer">Submit</button>        
        <div v-show="submitted">
          <p>Successfully submitted!</p>
        </div> 
        <!-- Errors point to network problems. -->
        <div v-show="error">
          <p>Error while submitting. Please reload the page and try again.</p>
        </div>           
        <p></p>
        <!--<answer-node-tree :answers="selectedAnswers" :studytitle="this.answerData.id" v-on:addedfile="handleFileUpload"></answer-node-tree>-->
    </div>

  </div>
</template>

<script>
//import AnswerNodeTree from "./AnswerNodeTree";
import axios from "axios";

export default {
  props: {
    answerData: Object,
    detailData: Object
  },
  data() {
    return{
      studytitle: this.answerData.study,
      id: this.answerData.id,
      studydesc: "",
      institution: this.answerData.institutions,
      country: this.answerData.country,
      topics: this.answerData.topics,
      applicationpid: this.answerData.pid,
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
    //AnswerNodeTree
  },
  methods: {
    handleFileUpload: function(event){
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
        'id': this.id,
        'title': this.studytitle,
        'country': this.country,
        'institution': this.institution,
        'description': this.studydesc
      };
      var nospaces = this.topics.replace(/\s/g, "");
       axios
      .post('http://localhost:3000/smwapi', params)
      .then(response => {
        if(response.status === 200){
          this.submitted = true;
          return axios.put('http://localhost:3000/answers/' + this.id + '/', {answer: {id: this.id, topics: nospaces, pid:this.pid, country: this.country, institutions: this.institution}})
        }
        else{
          this.error = true;
        }
      })
      } 
  }
  
};
</script>
