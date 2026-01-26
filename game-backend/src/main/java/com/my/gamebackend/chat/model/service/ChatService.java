package com.my.gamebackend.chat.model.service;

import com.my.gamebackend.chat.model.dto.ChatConversation;
import com.my.gamebackend.chat.model.dto.ChatMessage;
import com.my.gamebackend.chat.model.dto.ChatRequest;
import com.my.gamebackend.chat.model.dto.ChatResponse;

import java.util.List;

public interface ChatService {
    ChatResponse sendMessage (ChatRequest request);
    List<ChatMessage> getConversationHistory (Long conversationId);
    List<ChatConversation> getUserConversations (String userId);
}
