/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.business.dto.model;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author gjh
 */
@XmlRootElement
public class RestfulResult {
    private int resultCode;
    private String resultMessage;

    public int getResultCode() {
        return resultCode;
    }

    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }
  
}
