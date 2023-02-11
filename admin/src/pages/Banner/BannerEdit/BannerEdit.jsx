import React, {useState, useEffect} from 'react'
import { useParams, useNavigate, Link} from 'react-router-dom'
import {DriveFolderUploadOutlined, Upload} from "@mui/icons-material";
import axios from "axios";

import "./BannerEdit.scss"
import {Sidebar, Navbar} from "../../../components"

const BannerEdit = () => {
  const [bannerFile, setFile] = useState("");
  const params = useParams();
  const navigate = useNavigate();
  // const[data,setData] =useState("")
  const [name, setName] = useState("");
  const [description, setDescription] = useState("");
  const [file, setImage] = useState("");

  // useEffect(async () => {

  //  await getBannerDetails(params.id);
  // }, [])

  useEffect(() => {
    getBannerDetails(params.id);
  }, [])

  //api integrate to fetch details
  const getBannerDetails = async (id) => {

    var result = await axios.post('http://localhost:8000/api/banner/getBannerById',
      { id })
    var result = await result.data

    setName(result[0].name);
    console.log(result[0].name)

    setDescription(result[0].description);
    console.log(result[0].description)

    setImage(result[0].image);
    console.log(result[0].image)

  }




  const onFileChange = (e) => {
    console.log(e.target.files[0]);
    if (e.target && e.target.files[0]) {
      setFile(e.target.files[0]);
    }
  };

  const editBanner = async () => {

    try {
      const formData = new FormData();
      formData.append("id", params.id)
      formData.append("image", bannerFile);
      formData.append("name", name);
      formData.append("description", description);
      const config = {
        headers: {
          "content-type": "multipart/form-data"
        }
      };
      const API = "banner/editBannerById";
      const HOST = "http://localhost:8000/api";
      const url = `${HOST}/${API}`;

      const result = await axios.post(url, formData, config);



    } catch (error) {
      console.error(error);
    }
    window.location.reload()


  };
  return (
    <div className="bannerview">
      <Sidebar />
      <div className="bannerviewContainer">
        <Navbar />
        <div className="tempE">
          <div className="row">
            <div className="col-2"></div>
            <div className="col-8  d-flex justify-content-center">
              <div>
                <div className="camp1">
                <div className="campimg d-flex justify-content-center">
                  <input
                    type="file"
                    id="file"
                    onChange={onFileChange}
                    style={{ display: "none" }}
                    name="categoryIcon"
                  />
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
                  <label htmlFor="file" className="custom-file-upload">
                    <input type="file" />
                    <Upload className="icon" />Upload Images
                  </label>
                </div>
                <div className="details mb-4">
                  <h5 className="field" >
                    Banner Name:
                  </h5>
                  <input
                    type="text"
                    name="Name"

                    size="80"
                    value={name} onChange={(e) => { setName(e.target.value) }}
                  />
                </div>
                <div className="details mb-4">
                  <h5 className="field" >
                    Banner Category:
                  </h5>
                  <input
                    type="text"
                    name="Name"

                    size="80"
                    value={description} onChange={(e) => { setDescription(e.target.value) }}
                  />
                </div>
                  
                <Link to="/banners"> <button className='buttonX' onClick={(e) => editBanner()} >  Done</button></Link>
                    </div>
              </div>
            </div>
            <div className="col-2"></div>
          </div>



        </div>

      </div>


    </div>
  )
}

export default BannerEdit