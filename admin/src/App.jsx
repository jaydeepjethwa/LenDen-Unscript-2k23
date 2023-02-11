import { BrowserRouter, Routes, Route } from 'react-router-dom';

import { Login, Home, List, New, Single, Banner } from './pages';
import { userInputs, productInputs } from './constants';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/">
            <Route index element={<Home />} />
            <Route path="login" element={<Login />} />
          </Route>

          <Route path="users">
            <Route index element={<List />} />
            <Route path=":userId" element={<Single />} />
            <Route path="new" element={<New inputs={userInputs} title="Add New User" />} />
          </Route>

          <Route path="products">
            <Route index element={<List />} />
            <Route path=":productId" element={<Single />} />
            <Route path="new" element={<New inputs={productInputs} title="Add New Product" />} />
          </Route>

          <Route path="banners">
            <Route index element={<Banner />} />
            <Route path="view/:id" element={<Single />} />
            <Route path="edit/:id" element={<Single />} />
            <Route path="new" element={<New inputs={productInputs} title="Add New Product" />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
