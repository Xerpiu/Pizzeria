import React, { FunctionComponent } from 'react'
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom'
import 'normalize.css'

import { Page404, HomePage } from 'pages'

import GlobalStyles from 'GlobalStyles'

const App: FunctionComponent = (): JSX.Element => {
  return (
    <>
      <GlobalStyles />
      <Router>
        <Switch>
          <Route exact path="/">
            <HomePage />
          </Route>
          <Route exact path="*">
            <Page404 />
          </Route>
        </Switch>
      </Router>
    </>
  )
}

export default App
