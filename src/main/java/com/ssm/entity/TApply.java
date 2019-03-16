package com.ssm.entity;

public class TApply {
    private Integer id;

    private Integer userId;

    private Integer pantsNum;

    private Integer clothesNum;

//    状态（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。4-不同意）
    private String status;

    private String logisticsNumber;

    private String logisticsCompany;

    private String remark;

    private String applyTime;

    private String updateTime;

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPantsNum() {
        return pantsNum;
    }

    public void setPantsNum(Integer pantsNum) {
        this.pantsNum = pantsNum;
    }

    public Integer getClothesNum() {
        return clothesNum;
    }

    public void setClothesNum(Integer clothesNum) {
        this.clothesNum = clothesNum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getLogisticsNumber() {
        return logisticsNumber;
    }

    public void setLogisticsNumber(String logisticsNumber) {
        this.logisticsNumber = logisticsNumber == null ? null : logisticsNumber.trim();
    }

    public String getLogisticsCompany() {
        return logisticsCompany;
    }

    public void setLogisticsCompany(String logisticsCompany) {
        this.logisticsCompany = logisticsCompany == null ? null : logisticsCompany.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime == null ? null : applyTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }
}