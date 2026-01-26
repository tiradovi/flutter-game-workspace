package com.my.gamebackend.chat.model.mapper;

import com.my.gamebackend.chat.model.dto.ChatConversation;
import com.my.gamebackend.chat.model.dto.ChatMessage;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ChatMapper {
    void createConversation(ChatConversation conversation);
    void saveMessage(ChatMessage message);
    ChatConversation getConversation(Long id);
    List<ChatMessage> getMessages(Long conversationId);
    List<ChatConversation> getUserConversations(String userId);
    void updateConversation(Long id);
}