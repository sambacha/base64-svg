import React, {
  PureComponent
} from 'react'
import {
  toDataUrl
} from './blockies/blockies'
import './BlockiesIdenticon.css'

class BlockiesIdenticon extends PureComponent {
  render() {
    return <img className = 'blockie'
    src = {
      toDataUrl(this.props.account)
    }
    alt = {
      this.props.account
    }
    />
  }
}

module.exports = BlockiesIdenticon