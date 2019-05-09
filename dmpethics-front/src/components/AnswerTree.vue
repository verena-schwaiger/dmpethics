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

        <label class="form-label">Author(s)</label>
        <input type="text" class="input" name="author" v-model="author">

        <label class="" :for="studytitle">Existing Application PID</label>
        <input type="text" class="input" name="applicationpid" v-model="applicationpid">

        <label class="form-label">Involved institution(s)</label>
        <input type="text" class="input" name="institution" v-model="institution">

        <label class="form-label">Country</label>
        <input type="text" class="input" name="country" v-model="country">
        
        <label class="form-label">Keywords</label>
        <input type="text" class="input" name="topics" v-model="topics">

        <label class="form-label">Ethics factors</label>
        <input type="text" class="input" name="ethics" v-model="ethics">
      </div>
      <div class="form-field">
        <label class="form-label">Study description</label><br>
        <textarea name="studydesc" v-model="studydesc"></textarea>
      </div>    
      <div v-show="!loading">
        <button class="button" @click="saveAnswer">Save and submit to Wiki</button>  
        <button class="button" @click="saveAnswerLocally">Save without submitting to Wiki</button>   

        <div align="right" class="delete"><button class="button" v-on:click="deleteStudy(); $emit('update-answer', id)">Delete study here and on Wiki</button></div>
        <div align="right" class="delete"><button class="button" v-on:click="deleteStudyOnWiki(); $emit('update-answer', id)">Delete study only on Wiki</button></div>
        <div align="right" class="delete"><button class="button" v-on:click="deleteStudyLocally(); $emit('update-answer', id)">Delete study only here</button></div>

      </div>   
      <div v-show="loading">
        <img src="@/assets/loading.gif" width="70px" height="35px">
      </div>  
      <div v-show="submitted">
        <p>Successfully submitted!</p>
      </div> 
      <!-- Errors point to network problems. -->
      <div v-show="error">
        <p>Error while submitting. Please reload the page and try again.</p>
      </div>           
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: {
    answerData: Object
  },
  data() {
    return{
      studytitle: this.answerData.study,
      id: this.answerData.id,
      studydesc: this.answerData.description,
      institution: this.answerData.institutions,
      country: this.answerData.country,
      topics: this.answerData.topics,
      applicationpid: this.answerData.pid,
      author: this.answerData.authors,
      ethics: this.getEthicsFactors(),
      existingdata: "",
      nospaces: "",
      files:[],
      submitted: false,
      error: false,
      loading: false
    }
  },
  methods: {
    handleFileUpload: function(event){
       this.files.push(event);
    },
    getEthicsFactors(){
      var ethicsFactors = [], questions = JSON.parse(this.answerData.data).questiondata.children;
      for (var i = 0; i < questions.length; i++) {
        var q = questions[i];
        if (q.keyword !== "" && q.checked === true)
          ethicsFactors.push(q.keyword);
        for(var j = 0; j < q.children.length; j++){
          if (q.children[j].keyword !== "" && q.children[j].checked === true)
            ethicsFactors.push(q.children[j].keyword);
          for (var k = 0; k < q.children[j].length; k++){
            if (q.children[j].children[k].keyword !== "" && q.children[j].children[k].checked === true)
              ethicsFactors.push(q.children[j].children[k].keyword);
          }
        }
      }
      return ethicsFactors;
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
      this.loading = true;
      this.submitted =false;

      if(this.topics !== null){
        this.nospaces = this.topics.replace(/\s/g, "");
      }

      var params = {
        'id': this.id,
        'title': this.studytitle,
        'country': this.country,
        'institutions': this.institution,
        'description': this.studydesc,
        'authors': this.author,
        'pid': this.applicationpid,
        'topics': this.nospaces,
        'ethics': this.ethics.toString()
      };

      axios
      .post('http://localhost:3000/smwapi', params)
      .then(response => {
        if(response.status === 200){
          this.submitted = true;
          this.loading = false;
          return axios.put('http://localhost:3000/answers/' + this.id + '/', {answer: params})
        }
        else{
          this.error = true;
        }
      })
    },
    saveAnswerLocally() {
      this.submitted =false;
      this.loading = true;

      if(this.topics !== null){
        this.nospaces = this.topics.replace(/\s/g, "");
      }

      var params = {
        'id': this.id,
        'title': this.studytitle,
        'country': this.country,
        'institutions': this.institution,
        'description': this.studydesc,
        'authors': this.author,
        'pid': this.applicationpid,
        'topics': this.nospaces,
        'ethics': this.ethics.toString()
      };

       axios
      .put('http://localhost:3000/answers/' + this.id + '/', {answer: params})
      .then(response => {
        if(response.status === 200){
          this.submitted = true;
          this.loading = false;
        }
        else{
          this.error = true;
        }
      })
    },
    deleteStudy() {
        Promise.all([axios.delete('http://localhost:3000/smwapi/' + this.id + '/'),
          axios.delete('http://localhost:3000/answers/' + this.id + '/')])
    },
    deleteStudyOnWiki() {
      axios.delete('http://localhost:3000/smwapi/' + this.id + '/')
    },
    deleteStudyLocally() {
      axios.delete('http://localhost:3000/answers/' + this.id + '/')
    }
  }
  
};
</script>
