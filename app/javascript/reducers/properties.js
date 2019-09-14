const properties  = (state = [], action) => {
    switch (action.type) {
      case 'ADD_PROPERTY':
        return [
          ...state,
          {
            id: action.id,
            text: action.text,
            completed: false
          }
        ]
      default:
        return state
    }
  }
  
  export default properties;