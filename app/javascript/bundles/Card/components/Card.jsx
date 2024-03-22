import PropTypes from 'prop-types';
import React, { useState } from 'react';
import style from './Card.module.css';

const Card = (props) => {
  return (
    <div class="card d-flex container mt-1" style={{border: "none", width: "19rem"}}>
        <div class="card p-1 bg-white"><i class="fa fa-apple"></i>
            <div class="about-product text-center mt-1">
                <img src={props.photo} width="150" />
                <div class="row">
                    <h4>{props.crypto.asset_id_quote}</h4>
                </div>
                <div class="">
                  <span className={"badge text-bg-primary"} >
                  <h4>{props.crypto.rate}</h4>
                  </span>
                </div>
            </div>
        </div>
    </div>
  );
};

export default Card;
