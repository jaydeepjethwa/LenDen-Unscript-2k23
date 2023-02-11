import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import UploadIcon from '@mui/icons-material/Upload';
import axios from 'axios';

import './NewBanner.scss';
import { Sidebar, Navbar } from '../../../components';

const NewBanner = ({title}) => {
  const[count,setCount]=useState("")
  const [bannerFile, setFile] = useState("");
  const [text, setText] = useState("");
  const [data, setData] = useState({
    name: "",

  })
  let navigate = useNavigate();
  function handle(e) {
    const newdata = { ...data };
    newdata[e.target.id] = e.target.value;
    setData(newdata);
    console.log(newdata);
  }

  const onFileChange = (e) => {
    setCount(1)
    console.log(e.target.files[0]);
    if (e.target && e.target.files[0]) {
      setFile(e.target.files[0]);
    }
  };

  const uploadImage = async () => {
    if(count){
      try {
        const formData = new FormData();
        formData.append("image", bannerFile);
        formData.append("name", data.name);
        formData.append("description", text);
        const config = {
          headers: {
            "content-type": "multipart/form-data"
          }
        };
        const API = "banner/addBanner";
        const HOST = "http://localhost:8000/api";
        const url = `${HOST}/${API}`;
  
        const result = await axios.post(url, formData, config);
  
  
  
      } catch (error) {
        console.error(error);
      }
      navigate('/banners', { replace: true });
      window.location.reload()
    }else{
      alert("PLZZ upload the image")
    }

  };
  return (
    <div className="addNew">
      <Sidebar />
      <div className="newContainer">
        <Navbar />
        <div className="newCard">
          <div className="row">
            <div className="col-2"></div>
            <div className="col-8">
              <div className="newTitle mt-2 mb-5 d-flex justify-content-center">

                <h1> <strong>{title}</strong> </h1>
              </div>
              <div className="newForm ">
                <div className="d-flex justify-content-center ">
                  <img
                    className="img-thumbnail previewImage"
                    src={
                      bannerFile
                        ? URL.createObjectURL(bannerFile)
                        : "https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg"
                    }
                  />
                </div>
                <div className="forInput mt-4 mb-4 d-flex justify-content-center" >
                  <label htmlFor="file" class="custom-file-upload">
                    <input type="file" />
                    <UploadIcon className="icon" />Upload Images
                  </label>
                </div>
                <form className="d-flex justify-content-center">
                  <div>


                    <input
                      type="file"
                      id="file"
                      onChange={onFileChange}
                      style={{ display: "none" }}
                      name="categoryIcon"
                    />
                    {/* <div className="formInput">
                                  <label><b> Name:</b></label>
                                  <input type="textarea" onChange={(e) => handle(e)} placeholder="Name...." size="88" id="categoryName" value={data.categoryName} />
                              </div> */}
                    <div className="details mb-4">
                      <h5 className="field" color="grey">
                        Banner Name:
                      </h5>
                      <input
                        type="text"
                        name="Nname"
                        id="name"
                        size="100"
                        onChange={(e) => handle(e)}
                        value={data.name}
                        placeholder="Banner Name"
                      />
                    </div>
                    {/* <div className="formInput">
                     
                      <textarea placeholder="About Product....." onChange={(e) => handle(e)} rows="8" cols="62.5" width="10px" border-radius="0.8px" id="description" value={data.description} />
                  </div> */}
                    {/* <div className=" mb-4">
                      <h5 className="field">Banner Category:</h5>
                      <CKEditor
                        editor={ClassicEditor}
                        config={{
                          removePlugins: ["EasyImage", "ImageUpload"]
                        }}
                        data={text}
                        onChange={(event, editor) => {
                          const data = editor.getData()
                          setText(data)

                        }} />
                    </div> */}
                    <Link to=""> <button className="buttonN mb-3" onClick={(e) => uploadImage()}>  Add New Banner </button></Link>
                  </div>
                </form>
              </div>
            </div>
            <div className="col-2"></div>
          </div>

        </div>
      </div>


    </div>
  );
};

export default NewBanner;
