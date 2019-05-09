<template>
  <div class="container"> 
    <checklist-node-tree :checklist="questiondata.questiondata" :studytitle="answerData.id"></checklist-node-tree>
    <div v-show="!loading">
      <button class="submitChecklist" @click="saveChecked">Save</button>   
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
</template>

<script>
import ChecklistNodeTree from "./ChecklistNodeTree";
import axios from "axios";

export default {
  props: {
    answerData: Object
  },
  data() {
    return{
      studytitle: this.answerData.study,
      questiondata: JSON.parse(this.answerData.data),
      list: null,
      existingdata: "",
      submitted: false,
      error: false,
      loading: false
    }
  },
  computed:{
    selectedAnswers (){
        return JSON.parse(this.answerData.data).questiondata
    }
  },
  components: {
    ChecklistNodeTree
  },
  methods: {
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
    saveChecked() {
      this.loading = true;
        axios.put('http://localhost:3000/answers/'+this.answerData.id+'/', {answer: {id: this.answerData.id, data: JSON.stringify(this.questiondata)}})
        .then(response => {
          if(response.status === 200){
            this.submitted = true;
            this.loading = false;
            this.$forceUpdate();
          }
          else{
            this.error = true;
            this.loading = false;
          }
      })
      } 
  }
};
</script>
