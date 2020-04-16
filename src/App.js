import React, { Component } from 'react'
import './App.css'

export default class App extends Component {
	constructor(prop){
		super(prop)
		this.state={item:['吃饭','睡觉','打豆豆']}
	}
	
	render(){
		return(
			<div>
				<input type="text" placeholder="添加待办事项" />
				<button type="button">确认添加</button>
				<ul>{this.state.item.map((item,i)=><li key={i}>{item}</li>)}</ul>
	        </div>
		
		)
	}
}



